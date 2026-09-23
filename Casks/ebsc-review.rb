cask "ebsc-review" do
  version "0.2.0"
  sha256 "29b337eb9c4e8788db627c025df37df8f92e14aedeb7561be332cbcb6c745abe"

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
