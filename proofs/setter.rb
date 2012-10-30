proofs_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'proofs'))
$LOAD_PATH.unshift proofs_dir unless $LOAD_PATH.include?(proofs_dir)

require 'setter/specific_setting'
require 'setter/all_settings'
