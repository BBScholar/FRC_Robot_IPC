def _deploy_impl(ctx):
  all_files = ctx.files.srcs + ctx.files.start_srcs + [ctx.outputs._startlist]
  ctx.file_action(
    output = ctx.outputs.executable,
    executable = True,
    content = '\n'.join([
      '#!/bin/bash',
      'set -e',
      'cd "${BASH_SOURCE[0]}.runfiles/%s"' % ctx.workspace_name,
    ] + ['%s %s --dirs %s -- %s "$@"' % (
       ctx.executable._downloader.short_path,
       ' '.join([src.short_path for src in d.downloader_srcs]),
       d.downloader_dir,
       ctx.attr.default_target) for d in ctx.attr.dirs] + [
      'exec %s %s -- %s "$@"' % (ctx.executable._downloader.short_path,
                                 ' '.join([src.short_path for src in all_files]),
                                 ctx.attr.default_target),
    ]),
  )

  ctx.file_action(
    output = ctx.outputs._startlist,
    content = '\n'.join([f.basename for f in ctx.files.start_srcs]) + '\n',
  )

  to_download = [ctx.outputs._startlist]
  to_download += all_files
  for d in ctx.attr.dirs:
    to_download += d.downloader_srcs

  return struct(
    runfiles = ctx.runfiles(
      files = to_download + ctx.files._downloader,
      transitive_files = ctx.attr._downloader.default_runfiles.files,
      collect_data = True,
      collect_default = True,
    ),
    files = depset([ctx.outputs.executable]),
  )
