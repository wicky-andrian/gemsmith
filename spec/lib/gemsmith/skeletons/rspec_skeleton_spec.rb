require "spec_helper"

describe Gemsmith::Skeletons::RspecSkeleton, :temp_dir do
  let(:gem_name) { "tester" }
  let(:gem_dir) { File.join temp_dir, gem_name }
  let(:options) { {} }
  let(:cli) { instance_spy Gemsmith::CLI, destination_root: temp_dir, gem_name: gem_name, template_options: options }
  subject { described_class.new cli }
  before { FileUtils.mkdir gem_dir }

  it_behaves_like "an optional skeleton", :rspec

  describe "#create" do
    before { subject.create }

    context "when enabled" do
      let(:options) { {rspec: true} }

      it "creates Rake file" do
        expect(cli).to have_received(:template).with("%gem_name%/lib/%gem_name%/tasks/rspec.rake.tt", options)
      end

      it "creates spec helper" do
        expect(cli).to have_received(:template).with("%gem_name%/spec/spec_helper.rb.tt", options)
      end

      it "creates gem spec" do
        expect(cli).to have_received(:template).with("%gem_name%/spec/lib/%gem_name%/%gem_name%_spec.rb.tt", options)
      end

      it "creates default config" do
        expect(cli).to have_received(:template).with("%gem_name%/spec/support/kit/default_config.rb.tt", options)
      end

      it "creates standard error support" do
        expect(cli).to have_received(:template).with("%gem_name%/spec/support/kit/stderr.rb.tt", options)
      end

      it "creates standard output support" do
        expect(cli).to have_received(:template).with("%gem_name%/spec/support/kit/stdout.rb.tt", options)
      end

      it "creates tempory directory support" do
        expect(cli).to have_received(:template).with("%gem_name%/spec/support/kit/temp_dir.rb.tt", options)
      end
    end

    context "when disabled" do
      let(:options) { {rspec: false} }

      it "does not create files" do
        expect(cli).to_not have_received(:template)
      end
    end
  end
end