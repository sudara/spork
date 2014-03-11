class Spork::TestFramework::RSpecSpec2 < Spork::TestFramework
  DEFAULT_PORT = 8989
  HELPER_FILE = File.join(Dir.pwd, "spec2/spec_helper.rb")

  def run_tests(argv, stderr, stdout)
    if rspec1?
      ::Spec::Runner::CommandLine.run(
        ::Spec::Runner::OptionParser.parse(argv, stderr, stdout)
      )
    else
      ::RSpec::Core::CommandLine.new(argv).run(stderr, stdout)
    end
  end

  def rspec1?
    defined?(Spec) && !defined?(RSpec)
  end
end
