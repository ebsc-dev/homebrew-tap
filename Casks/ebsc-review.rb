cask "ebsc-review" do
  version "0.1.0"
  sha256 "3b4ae964637829eda13ce4764eed60492d985b297cbd7e219003e583f729d361"

  url "https://github.com/ebsc-dev/review/releases/download/v#{version}/Review_#{version}_universal.dmg"
  name "Review"
  desc "Pull request review focused on business-logic regressions"
  homepage "https://github.com/ebsc-dev/review"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "gh"
  depends_on macos: :ventura

  app "Review.app"

  zap trash: [
    "~/Library/Application Support/dev.ebsc.review",
    "~/Library/Caches/dev.ebsc.review",
    "~/Library/Preferences/dev.ebsc.review.plist",
    "~/Library/Saved Application State/dev.ebsc.review.savedState",
    "~/Library/WebKit/dev.ebsc.review",
  ]

  caveats <<~EOS
    Review uses your own GitHub CLI and Codex CLI logins:
      gh auth login
    AI analysis also needs the Codex CLI, installed and logged in. Install it with
    Homebrew (brew install --cask codex), npm, or OpenAI's installer, then run:
      codex login
  EOS
end
