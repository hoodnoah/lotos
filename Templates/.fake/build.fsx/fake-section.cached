#r "paket:
nuget Fake.DotNet.Cli
nuget Fake.IO.FileSystem
nuget Fake.Core.Target //"
#load ".fake/build.fsx/intellisense.fsx"
open Fake.Core
open Fake.IO
open Fake.Core.TargetOperators

Target.initEnvironment ()

Target.create "Clean" (fun _ ->
  Shell.cleanDir "output"
)

Target.create "Build" (fun _ ->
  let errorCode = 
    match ProcessUtils.tryFindFileOnPath("kaitai-struct-compiler") with
    | Some g -> Shell.Exec(g, "src/wk1.ksy -t csharp -d output", ".")
    | None -> 1
  ()
)

Target.create "All" ignore

"Clean"
  ==> "Build"
  ==> "All"

Target.runOrDefault "All"
