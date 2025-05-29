# GitHub Actions Setup for Multi-Platform Flutter Releases

This repository is configured with GitHub Actions workflows that automatically build and release your Flutter app for multiple platforms when code is pushed to the main branch.

## 🚀 Automated Builds

### Triggered On:
- Push to `main` branch
- Git tags starting with `v*`

### Platforms Built:
- ✅ **Android** (APK + AAB)
- ✅ **iOS** (IPA - unsigned)
- ✅ **Windows** (ZIP package)
- ✅ **Web** (Progressive Web App)

## 📁 Workflow Files

### `build-and-release.yml` (Recommended)
- **Purpose**: Simple, reliable build and release workflow
- **Features**: 
  - Builds all platforms in parallel
  - Creates GitHub releases automatically
  - Uploads all platform binaries as release assets
  - Uses retention for build artifacts

### `release.yml` (Advanced)
- **Purpose**: More complex workflow with additional features
- **Features**:
  - Conditional release creation
  - More detailed release notes
  - Additional error handling

## 🛠️ Setup Requirements

### 1. Repository Secrets (Optional)
No additional secrets are required for basic functionality. The workflow uses the default `GITHUB_TOKEN`.

### 2. Windows Desktop Support
The workflow automatically enables Windows desktop support and creates the necessary platform files if they don't exist.

### 3. iOS Code Signing (For Distribution)
The iOS builds are created without code signing. For actual distribution:
- Add your Apple Developer certificates to repository secrets
- Modify the iOS build step to include code signing
- Use proper provisioning profiles

## 📱 Platform-Specific Notes

### Android
- Builds both APK (direct install) and AAB (Play Store) formats
- Uses Java 11 and the latest stable Flutter
- No additional configuration required

### iOS
- Builds unsigned IPA files
- Requires macOS runner (automatically handled)
- For device installation, you'll need to code sign the app

### Windows
- Automatically enables Windows desktop support
- Creates platform files if they don't exist
- Packages as ZIP for easy distribution

### Web
- Builds optimized web version
- Creates compressed archive for deployment
- Can be served from any web server

## 🔄 Workflow Process

1. **Code Push**: Developer pushes to main branch
2. **Parallel Builds**: All platforms build simultaneously
3. **Artifact Collection**: Build outputs are collected as artifacts
4. **Release Creation**: GitHub release is created with all binaries
5. **Asset Upload**: All platform files are attached to the release

## 📊 Build Status

You can monitor build status in the "Actions" tab of your GitHub repository. Each platform build runs independently, so if one fails, others can still succeed.

## 🎯 Version Management

Versions are automatically extracted from your `pubspec.yaml` file. To create a new release:

1. Update the version in `pubspec.yaml`
2. Push to main branch
3. GitHub Actions will automatically create a release with the new version

## 🔧 Customization

### Modify Flutter Version
Update the `FLUTTER_VERSION` environment variable in the workflow files.

### Add Additional Platforms
To add more platforms (like Linux), add a new job following the existing pattern.

### Custom Release Notes
Modify the release body template in the workflow files to customize release notes.

## 🚨 Troubleshooting

### Common Issues:

1. **Windows Build Fails**: 
   - Ensure Windows desktop support is enabled
   - Check if all dependencies are compatible with Windows

2. **iOS Build Issues**:
   - Verify iOS-specific dependencies
   - Check for platform-specific code that might not be compatible

3. **Android Build Problems**:
   - Verify Java version compatibility
   - Check Android SDK requirements in `android/app/build.gradle`

### Debug Steps:
1. Check the Actions tab for detailed logs
2. Review individual job outputs
3. Test builds locally using the same Flutter version

## 📄 License

Make sure your app complies with all relevant licenses, especially when distributing across multiple platforms.

---

**Note**: This setup provides a solid foundation for automated releases. You may need to customize it based on your specific requirements, such as adding code signing for iOS, or configuring Windows MSIX packaging.
