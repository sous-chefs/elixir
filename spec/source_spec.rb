require 'spec_helper'

describe 'elixir::source' do
  let(:chef_run)   { ChefSpec::Runner.new.converge(described_recipe) }
  let(:git_elixir) { chef_run.git('elixir') }

  it 'includes erlang::default recipe' do
    expect(chef_run).to include_recipe('erlang::default')
  end

  it 'includes git::default recipe' do
    expect(chef_run).to include_recipe('git::default')
  end

  describe "git 'elixir'" do
    it 'syncs the elixir git repository' do
      expect(chef_run).to sync_git('elixir')
    end

    it "syncs with the git repository attribute" do
      expect(chef_run).to sync_git('elixir').
        with(repository: chef_run.node[:elixir][:source][:repo])
    end

    it 'notifies the bash[elixir-make-clean] resource to run immediately' do
      expect(git_elixir).to notify('bash[elixir-make-clean]').to(:run).immediately
    end
  end

  it 'runs bash elixir-make' do
    expect(chef_run).to run_bash('elixir-make').
      with_cwd(chef_run.node[:elixir][:install_path])
  end
end
