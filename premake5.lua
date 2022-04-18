local ROOT_DIR = '.'

include ('vcpkg.lua')

workspace "RPFXplorer"
   configurations { "Debug", "Release" }
    platforms { "Win64" }
    language "C++"
    targetdir ( ROOT_DIR .. "/bin/%{cfg.buildcfg}" )

    cppdialect "C++20"

    files { "vcpkg.json" }

    include('Code/LibRPF')
    include('Code/ShellExtension')

    -- Tests
    group "Tests"
        include('Code/LibRPF.Tests')
    group ""

if _ACTION == 'clean' then
    os.rmdir('bin')
    os.rmdir('obj')
    os.rmdir('.vs')
    os.remove('**.sln')
    os.remove('**.vcxproj')
    os.remove('**.vcxproj.*')
    os.remove('**.wixobj')
    os.remove('**.wixpdb')
    os.remove('**.msi')
end
