task :setup do
  system 'ruby setup.rb'
end

task :test, [:day] do |task, args|
  if args.day
    system "rspec spec/day#{args.day}_spec.rb"
  else
    system 'rspec'
  end
end

task :run, [:day] do |task, args|
  raise ArgumentError.new("Invalid argument!") if !args.day
  system "ruby src/day#{args.day}.rb"
end
