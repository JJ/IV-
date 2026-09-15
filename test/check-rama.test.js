const { test, mock } = require('node:test')
const assert = require('node:assert/strict')
const checkRama = require('../lib/check-rama.js')

function makeDeps() {
  return {
    github: {
      rest: {
        issues: { createComment: mock.fn(async () => ({})) },
        pulls: { update: mock.fn(async () => ({})) }
      }
    },
    context: { repo: { owner: 'JJ', repo: 'plantilla-IV' } },
    core: { setFailed: mock.fn() }
  }
}

test('rejects a PR opened from "main"', async () => {
  const { github, context, core } = makeDeps()

  await checkRama({ github, context, core, rama: 'main', prNumber: 42 })

  assert.equal(github.rest.issues.createComment.mock.callCount(), 1)
  const commentCall = github.rest.issues.createComment.mock.calls[0].arguments[0]
  assert.equal(commentCall.owner, 'JJ')
  assert.equal(commentCall.repo, 'plantilla-IV')
  assert.equal(commentCall.issue_number, 42)
  assert.match(commentCall.body, /rama `main`/)

  assert.equal(github.rest.pulls.update.mock.callCount(), 1)
  const updateCall = github.rest.pulls.update.mock.calls[0].arguments[0]
  assert.equal(updateCall.pull_number, 42)
  assert.equal(updateCall.state, 'closed')

  assert.equal(core.setFailed.mock.callCount(), 1)
  assert.match(core.setFailed.mock.calls[0].arguments[0], /no se pueden crear PRs desde la rama main/)
})

test('rejects a PR opened from "master"', async () => {
  const { github, context, core } = makeDeps()

  await checkRama({ github, context, core, rama: 'master', prNumber: 7 })

  assert.equal(github.rest.issues.createComment.mock.callCount(), 1)
  assert.equal(github.rest.pulls.update.mock.callCount(), 1)
  assert.equal(core.setFailed.mock.callCount(), 1)
})

test('accepts a PR opened from a feature branch', async () => {
  const { github, context, core } = makeDeps()

  await checkRama({ github, context, core, rama: 'feature/HU1', prNumber: 1 })

  assert.equal(github.rest.issues.createComment.mock.callCount(), 0)
  assert.equal(github.rest.pulls.update.mock.callCount(), 0)
  assert.equal(core.setFailed.mock.callCount(), 0)
})
