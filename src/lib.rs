use zed_extension_api as zed;

struct MxExtension {}

impl MxExtension {
    const MX_BINARY_NAME: &'static str = "mx";
}

impl zed::Extension for MxExtension {
    fn new() -> Self {
        MxExtension {}
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command, String> {
        let path = worktree
            .which(Self::MX_BINARY_NAME)
            .ok_or_else(|| format!("Could not find {} binary", Self::MX_BINARY_NAME))?;

        Ok(zed::Command {
            command: path,
            args: vec!["server".to_string()],
            env: vec![],
        })
    }
}

zed::register_extension!(MxExtension);
