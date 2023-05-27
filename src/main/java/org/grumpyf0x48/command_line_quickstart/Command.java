package org.grumpyf0x48.command_line_quickstart;

import picocli.CommandLine;

import java.util.concurrent.Callable;

@CommandLine.Command(name = "Command", version = "0.1-SNAPSHOT", mixinStandardHelpOptions = true)
public class Command implements Callable<Integer> {

    @Override
    public Integer call() {
        return 0;
    }

    public static void main(String[] args) {
        int exitCode = new CommandLine(new Command()).execute(args);
        System.exit(exitCode);
    }
}
