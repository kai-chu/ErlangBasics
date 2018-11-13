{ application, helloapp,
 [{description, "Hello world app release"},
  {vsn, "1.0"},
  {modules, [helloworldapp, hellosupervisor, helloprocess]},
  {applications, [kernel, stdlib]},
  {mod, {helloworldapp,[]}}
 ]}.