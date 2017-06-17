Stream.resource(
                # Open the file
                fn -> File.open!("sample") end,

                # The file is open, read lines one by one
                fn file ->
                  case IO.read(file, :read) do
                    data when is_binary(data) -> {[data], file}
                    _ -> {:halt, file}
                  end
                end,

                # Close the file
                fn file -> File.close(file) end
              )
