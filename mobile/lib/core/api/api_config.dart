/// API base URL for the local dev backend.
///
/// - Web (Chrome) and iOS Simulator: 127.0.0.1 reaches the host machine directly.
/// - Android emulator: 127.0.0.1 refers to the emulator itself, not the host --
///   use 10.0.2.2 instead.
/// - A physical device (the APK build) can't reach 127.0.0.1 at all -- it needs
///   the host machine's LAN IP, since the phone and the dev machine are two
///   separate devices on the same Wi-Fi. Update this if that IP changes.
const String apiBaseUrl = 'http://192.168.1.65:8000/api/v1';
