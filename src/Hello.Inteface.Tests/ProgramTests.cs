using System;
using System.IO;
using Xunit;

namespace Hello.Interface.Tests
{
    public class ProgramTests
    {
        [Fact]
        public void RunPrintsConsoleMessage()
        {
            string expected = $"Hello, Pluralsight!{Environment.NewLine}";
            using StringWriter writer = new StringWriter();
            Console.SetOut(writer);
            Program.Main(new string[]{});
            Assert.Equal(expected, writer.ToString());
        }
    }
}
