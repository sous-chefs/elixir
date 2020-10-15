describe command 'elixir -v' do
  its('exit_status') { should eq 0 }
  its('stdout') { should match /Elixir 1\.11\.0/ }
end
