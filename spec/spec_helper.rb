$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'inploy'
require 'spec'
require 'ruby-debug'
require 'fakefs'

FakeFS.activate!

def mute(object)
  object.stub!(:puts)
end

def stub_commands
  Kernel.stub!(:system)
end

def expect_command(command)
  Kernel.should_receive(:system).with(command)
end

def dont_accept_command(command)
  Kernel.should_not_receive(:system).with(command)
end

def stub_file(file, result)
  File.stub!(:exists?).with(file).and_return(result)
end

def file_doesnt_exists(file)
  stub_file file, false
end

def file_exists(file)
  FileUtils.touch file
end

def path_exists(path)
  FileUtils.mkdir_p path
end