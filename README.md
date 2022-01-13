# asksec

A simple CLI to test permissions from any macOS terminal app.

## Building

run `./build`

## Usage

Either use the binary you built or run `swift run asksec`

```
$ swift run asksec --help
USAGE: ask-sec [--contact] [--calendar] [--reminder]

OPTIONS:
  --contact               Ask for contacts permissions.
  --calendar              Ask for calendar permissions.
  --reminder              Ask for reminders permissions.
  -h, --help              Show help information.
```

After you run the app the system should show a dialog for each permission you requested. Do not to run this from tmux (it may not be connected to your active terminal).

Then the terminal application that you started it from should show up in `Settings`, `Security & Privacy`, `Privacy` under the permission you requested (with a checkbox if you answered allow).

If you do not get a prompt and your terminal app is not shown in `Settings` there may be a bug in your terminal application (test with macOS Terminal first).

## Testing

To reset access:

```
tccutil reset AddressBook
tccutil reset Calendar
tccutil reset Reminders
```
