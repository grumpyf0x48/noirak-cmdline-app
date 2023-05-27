package org.grumpyf0x48.command_line_quickstart;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import picocli.CommandLine;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CommandTest {

    private final ByteArrayOutputStream outputStreamCaptor = new ByteArrayOutputStream();

    @BeforeEach
    public void setUp() {
        System.setOut(new PrintStream(outputStreamCaptor));
    }

    @Test
    public void commandCallReturnsZero() {
        Command command = new Command();
        assertEquals(0, command.call());
    }

    @Test
    public void commandWithHelpArgsDisplaysUsage() {
        new CommandLine(new Command()).execute(new String[]{"--help"});
        String expectedOutput = """
            Usage: Command [-hV]
              -h, --help      Show this help message and exit.
              -V, --version   Print version information and exit.
            """;
        assertEquals(expectedOutput, outputStreamCaptor.toString());
    }
}
