const { all_good, ramaNoValidaMsg } = require("./mensajes.js")

module.exports = async function checkRama({ github, context, core, rama, prNumber }) {
  console.log("» Comprobando rama del PR: " + rama)

  if (rama === "main" || rama === "master") {
    await github.rest.issues.createComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      issue_number: prNumber,
      body: ramaNoValidaMsg(rama)
    })
    await github.rest.pulls.update({
      owner: context.repo.owner,
      repo: context.repo.repo,
      pull_number: prNumber,
      state: 'closed'
    })
    core.setFailed(`PR cerrado automáticamente: no se pueden crear PRs desde la rama ${rama}`)
  } else {
    console.log(all_good(`La rama '${rama}' es apropiada para el PR`))
  }
}
