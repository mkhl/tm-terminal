require "#{ENV["TM_SUPPORT_PATH"]}/lib/escape"

def mkpath(path)
  proc { |*args| File.join(path, *args) }
end

tm_app = mkpath(`osascript -e 'POSIX path of (path to app "TextMate")'`.chomp)
local_app_support = mkpath(`osascript -e 'POSIX path of (path to application support from local domain)'`.chomp)
user_app_support = mkpath(`osascript -e 'POSIX path of (path to application support from user domain)'`.chomp)

bundle_paths = [
  # User Domain
  user_app_support['TextMate/Bundles'],
  user_app_support['TextMate/Pristine Copy/Bundles'],
  # Local Domain
  local_app_support['TextMate/Bundles'],
  local_app_support['TextMate/Pristine Copy/Bundles'],
  # Application
  tm_app['Contents/SharedSupport/Bundles'],
]

puts <<-SHELL
export TM_APP_PATH="#{e_sh(tm_app[])}"
export TM_BUNDLE_SEARCH_PATH="#{e_sh(bundle_paths.join(":"))}"

__tm_bundle_switch () {
  local bundle="$1"
  # local bundle_short="${1/ /}"
  local bundle_short="$(echo $bundle | sed 's/ //g')"
  local bundle_shorter="${bundle_short%(*)}"
  for b in "$bundle" "$bundle_short" "$bundle_shorter"; do
    for d in #{bundle_paths.map(&method(:e_sh)).join(" ")}; do
      local bundle_path="$d/$b.tmbundle"
      local bundle_support="$bundle_path/Support"
      if [[ -d "$bundle_path" ]]; then
        export TM_BUNDLE_PATH="$bundle_path"
        if [[ -d "$bundle_support" ]]; then
          export TM_BUNDLE_SUPPORT="$bundle_support"
        else
          unset TM_BUNDLE_SUPPORT
        fi
        return
      fi
    done
  done
  echo >&2 "Bundle not found: $1"
  return 1
}

__tm_bundle_grep () {
  command ls -d {#{bundle_paths.map(&method(:e_sh)).join(",")}}/*.tmbundle | grep "$@"
}

__tm_reload () {
  osascript -e 'tell app "TextMate" to reload bundles'
}
SHELL

# puts txt