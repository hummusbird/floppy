using System.Runtime.InteropServices;
using System.Diagnostics;

namespace player;
class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
        Play("../1mb/sex.mp3");
    }

    public static void Play(string sound)
    {
        string program = "vlc.exe";

        if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
            program = "cvlc";

        string path = Path.GetFullPath(sound);

        var pi = new ProcessStartInfo(path)
        {
            Arguments = Path.GetFileName(path) + " --play-and-exit",
            UseShellExecute = true,
            WorkingDirectory = Path.GetDirectoryName(path),
            FileName = program,
            Verb = "OPEN",
            WindowStyle = ProcessWindowStyle.Hidden
        };

        Process p = new Process();
        p.StartInfo = pi;
        p.Start();
        Thread.Sleep(1000);
        p.Kill();
        Console.WriteLine("guh");
        p.WaitForExit();
    }
}
