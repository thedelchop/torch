defmodule Mix.Tasks.Torch.InstallTest do
  use Torch.MixCase

  setup_all :prepare_example_apps

  describe ".run/1" do
    setup :clean_generated_files

    test_mix_config_errors("torch.install")

    @tag :integration
    test "injects layout template into regular project" do
      for format <- @formats do
        System.cmd("mix", ["torch.install", "--format", "#{format}"], cd: @project_dir)

        assert File.exists?(
                 "#{@project_dir}/lib/example_web/templates/layout/torch.html.#{format}"
               )
      end
    end

    # TODO: add test for umbrella project
  end
end
