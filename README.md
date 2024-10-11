# Instructions for your project

A few steps to create and configure your project

## Putting In Development Mode

Recompose the database:

```bash
rails db:drop db:create db:migrate db:seed
```

Migrate the database:

```bash
rails db:migrate
rails db:rollback
rails db:rollback db:migrate
```

## Testing

Run tests:

```bash
rails test
```

For Migrations (Remembering That You May Need To Run Both In Development And Test):

```bash
rails db:migrate
```

## Security

It's a good practice to use annotate, brakeman and rubocop when you are developing. You can setup your own configuration using the example that exists in `.vscode.example` renaming to `.vscode`. Also running docker command to annotate, cover with rubocop and brakeman:

```bash
bundle exec annotate
bin/rubocop -A
bundle exec brakeman
```

or with just one command:

```bash
bundle exec rubocop -A ; bundle exec brakeman ; bundle exec annotate
```

## Git Flow

This project uses the Git Flow branching model to manage development and releases. Below are the basic commands to get started with Git Flow.

### Git Flow Branches

- **`main`**: The production-ready branch.
- **`staging`**: The staging-ready branch.
- **`develop`**: The branch where features are integrated.
- **`feature/{feature-name}`**: Branches for developing new features.
- **`release/{version}`**: Branches for preparing a new release.
- **`hotfix/{fix-description}`**: Branches for urgent fixes.

1 . Start a New Feature:

```bash
git flow feature start {feature-name}
```

2 . Finish a Feature:

```bash
git flow feature finish {feature-name}
```

Replace {feature-name} with your feature name.

3 . Start a Release:

```bash
git flow release start {version}
```

Replace {version} with the version name.

4 . Finish a Release:

```bash
git flow release finish {version}
```

5 . Start a Hotfix:

```bash
git flow hotfix start {fix-description}
```

6 . Finish a Hotfix:

```bash
git flow hotfix finish {fix-description}
```
