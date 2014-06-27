part of irc.parser;

/**
 * IRC Message
 */
class Message {
  /**
   * Original Line
   */
  String line;

  /**
   * IRC Command
   */
  String command;

  /**
   * Message
   */
  String message;

  String _hostmask;

  /**
   * IRC v3 Tags
   */
  Map<String, String> tags;

  /**
   * Parameters
   */
  List<String> parameters;

  /**
   * Creates a new Message
   */
  Message({this.line, hostmask, this.command, this.message, this.parameters})
      : _hostmask = hostmask;

  @override
  String toString() => line;

  /**
   * Gets the Parsed Hostmask
   */
  Hostmask get hostmask => new Hostmask.parse(_hostmask);

  /**
   * The Plain Hostmask
   */
  String get plain_hostmask => _hostmask;
}

/**
 * Represents a Hostmask that has been parsed
 */
class Hostmask {
  static final HOSTMASK_REGEX = new RegExp("[!@]");

  /**
   * Nickname is Hostmask
   */
  String nickname;

  /**
   * User's Identity
   */
  String identity;

  /**
   * User's Hostname
   */
  String hostname;

  /**
   * Creates a Hostmask instance
   */
  Hostmask({this.nickname, this.identity, this.hostname});

  Hostmask.parse(String input) {
    var parts = input.split(HOSTMASK_REGEX);

    this.nickname = parts[0];
    this.identity = parts[1];
    this.hostname = parts[2];
  }
}