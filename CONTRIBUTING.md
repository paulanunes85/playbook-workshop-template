# Contributing Guidelines

🌟 Thank you for your interest in contributing to this workshop/playbook! We welcome contributions from everyone.

## How Can You Contribute?

### 1. 🐛 Report Issues
- Found a bug?
- Spotted an error in documentation?
- Have a suggestion for improvement?

**Create an issue** with:
- Clear, descriptive title
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Screenshots if applicable
- Your environment details

### 2. 📝 Improve Documentation
- Fix typos or grammar
- Clarify confusing sections
- Add examples
- Translate content
- Update outdated information

### 3. 💻 Contribute Code
- Fix bugs
- Add new exercises
- Improve existing examples
- Enhance scripts and tools
- Add tests

### 4. 🎨 Design and Content
- Create diagrams
- Improve slide templates
- Design workshop materials
- Develop new modules

### 5. 🗣️ Share Feedback
- Workshop experience
- Teaching tips
- Success stories
- Areas for improvement

## Getting Started

### 1. Fork the Repository
```bash
# Clone your fork
git clone https://github.com/YOUR-USERNAME/REPO-NAME.git

# Add upstream remote
git remote add upstream https://github.com/ORIGINAL-OWNER/REPO-NAME.git

# Keep your fork synchronized
git fetch upstream
git checkout main
git merge upstream/main
```

### 2. Create a Branch
```bash
# Create and switch to a new branch
git checkout -b feature/your-feature-name
# or
git checkout -b fix/issue-description
```

### 3. Make Your Changes
- Follow existing code style
- Update documentation if needed
- Add tests for new features
- Keep commits focused and clean

### 4. Commit Your Changes
```bash
# Stage your changes
git add .

# Commit with a descriptive message
git commit -m "feat: add new exercise for module 3"
# or
git commit -m "fix: correct typo in workshop guide"
# or
git commit -m "docs: update prerequisites section"
```

#### Commit Message Format
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks

### 5. Push and Create Pull Request
```bash
# Push your branch
git push origin feature/your-feature-name
```

Then on GitHub:
1. Go to your fork
2. Click "New Pull Request"
3. Select your branch
4. Fill out the PR template
5. Submit for review

## Pull Request Guidelines

### PR Title
Use the same format as commit messages:
- `feat: add Docker setup instructions`
- `fix: resolve issue #45 with exercise validation`

### PR Description Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Other (specify)

## Testing
- [ ] Tested locally
- [ ] All tests pass
- [ ] Added new tests

## Checklist
- [ ] Code follows project style
- [ ] Self-reviewed my code
- [ ] Commented complex areas
- [ ] Updated documentation
- [ ] No breaking changes

## Related Issues
Closes #XXX
```

## Code Standards

### General Guidelines
- Write clear, self-documenting code
- Use meaningful variable and function names
- Keep functions small and focused
- Comment complex logic
- Follow language-specific conventions

### Documentation Standards
- Use clear, concise language
- Include examples where helpful
- Keep formatting consistent
- Update table of contents if needed
- Check links work correctly

### Testing
- Write tests for new features
- Ensure existing tests pass
- Test edge cases
- Document test scenarios

## Review Process

1. **Automated Checks**
   - CI/CD runs tests
   - Linting checks pass
   - No merge conflicts

2. **Code Review**
   - At least one approval required
   - Address all feedback
   - Resolve conversations

3. **Final Steps**
   - Squash commits if requested
   - Update branch with main
   - Merge when approved

## Community Guidelines

### Be Respectful
- Welcome newcomers
- Be patient and kind
- Respect different viewpoints
- Give constructive feedback

### Be Collaborative
- Ask questions when unclear
- Share knowledge freely
- Help others learn
- Celebrate successes

### Be Professional
- Stay on topic
- No spam or self-promotion
- Follow code of conduct
- Maintain confidentiality

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Thanked in workshop materials
- Invited to contributor events

## Questions?

- 💬 **Discussions**: Use GitHub Discussions for questions
- 📧 **Email**: [maintainer@example.com]
- 📱 **Slack**: [Join our Slack channel]

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (see LICENSE file).

---

**Thank you for helping make this workshop/playbook better!** 🚀
