require 'optparse'

module Itp
  class CLI
    alias die exit

    def initialize; end
    attr_reader :options, :utility, :command

    def parse(args = ARGV)
      setup_operation(args)
      setup_options(args)
      validate!
    end

    private

    def setup_operation(args)
      if ARGV.length < 2
        print_usage
        die(1)
      else
        @utility = args[0]
        @command = args[1]
      end
    end

    def setup_options(args)
      opts = parse_options(args)
      @options = opts
    end

    def parse_options(argv)
      opts = {}

      @parser = OptionParser.new do |o|
        o.on '-d', '--daemon', 'Daemonize process' do |arg|
          opts[:daemon] = arg
        end

        o.on '-P', '--pidfile PATH', 'path to pidfile' do |arg|
          opts[:pidfile] = arg
        end

        o.on '-V', '--version', 'Print version and exit' do |_arg|
          puts "Itp #{Itp::VERSION}"
          die(0)
        end
      end

      @parser.banner = 'itp [options]'
      @parser.on_tail '-h', '--help', 'Show help' do
        puts @parser
        die 1
      end
      @parser.parse!(argv)

      opts
    end

    def validate!
      raise ArgumentError, "utility: #{utility} is not a valid value" unless Utilities::ALL.include?(utility)

      raise ArgumentError, "command: #{command} is not a valid value" unless %w[
        quiet start stop stop_on_complete
      ].include?(command)
    end

    def daemonize
      return unless options[:daemon]

      ::Process.daemon(true, false)
    end

    def run_sidekiq_operations
      case command
      when 'stop_on_complete'
        SidekiqManager::Sidekiq::StopOnComplete.new(options[:pidfile]).process
      else
        puts "invalid command: #{command}"
      end
    end
  end
end
