require("init.index")


print("Loading requires...")

for i,folder in pairs(folders) do
    for j,file in pairs(folder.files) do
        local module =
            string.format("src.%s.%s",folder.name,file)

        print("loading "..module)
        require(module)
    end
end
