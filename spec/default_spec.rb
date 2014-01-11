require 'spec_helper'

describe 'elixir::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes elixir::source recipe' do
    expect(chef_run).to include_recipe('elixir::source')
  end
end
