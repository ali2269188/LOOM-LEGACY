# LOOM-LEGACY

**LOOM-LEGACY** was my very first coded project—built entirely for practice during my early learning phase. It's a Ruby on Rails application that simulates basic operations of a textile company, such as managing production, inventory, and sales.

> ⚠️ **Disclaimer:**  
> This project was purely experimental and the code quality is extremely poor. It does not reflect my current skill level or development practices. I used this project to understand the basics of Rails, deployment, database management, and working with gems.

## Stack Overview

- **Framework:** Ruby on Rails
- **Language:** Ruby
- **Database:** SQLite (development), PostgreSQL (production)
- **Hosting:** AWS EC2

## Features (Experimental)

- Simulated department integration (production, inventory, sales)
- Basic visitor tracking using `ahoy_matey`, `geocoder`, and `browser`
- Feedback system (very basic)
- Manual deployment on EC2

## Gems Used

- `devise` – authentication
- `pg` – PostgreSQL adapter
- `ahoy_matey` – visitor analytics
- `geocoder` – location tracking
- `browser` – browser detection
- `actionmailer`, `mail` – basic email capabilities

## Setup (Optional for Learning)

### Prerequisites

- Ruby 3.x
- Rails 7.1
- PostgreSQL (for production)
- AWS EC2 (if deploying)

### Installation

```bash
git clone https://github.com/AliIshaqPro/LOOM-LEGACY.git
cd loom-legacy
bundle install
rails db:create
rails db:migrate
rails server
