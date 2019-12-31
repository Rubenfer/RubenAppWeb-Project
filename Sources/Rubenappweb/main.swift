import Publish

try RubenAppWeb().publish(using: [
    .copyResources(),
    .addPage(.tocPage),
    .generateHTML(withTheme: .rubenAppWeb),
    .deploy(using: .gitHub("Rubenfer/RubenAppWeb", useSSH: false))
])
