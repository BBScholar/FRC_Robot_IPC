set -e

bazel build \
  --experimental_action_listener=//tools/clang_tidy:extract_json \
  --noshow_progress \
  --noshow_loading_progress \
  $(bazel query 'kind(cc_.*, //...)') > /dev/null

pushd $(bazel info execution_root) > /dev/null
echo "[" > compile_commands.json
find . -name '*.compile_command.json' -exec bash -c "cat {} && echo ," \; >> compile_commands.json
sed -i .bak '$s/,$//' compile_commands.json
echo "]" >> compile_commands.json
popd > /dev/null