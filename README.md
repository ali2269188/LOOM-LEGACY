# LOOM-LEGACY

**LOOM-LEGACY** was part of my first ever portfolio project, built entirely for practice when I was just getting started with coding. Within this single Rails codebase, I attempted to create and showcase two separate applications:

1. **LOOM-LEGACY** – a textile company simulation with basic modules like production, inventory, and sales.
2. **Chatting App** – a simple messaging system to explore real-time communication features.

> ⚠️ **Disclaimer:**  
> This entire project was developed during my early learning phase. The code is extremely unorganized and poorly written, as I was just experimenting to understand how Rails works. It does **not** represent my current coding standards or architectural understanding.

---

## Project Purpose

This portfolio project helped me:
- Learn how to set up and structure a Rails application
- Understand core concepts like MVC, routing, ActiveRecord, and associations
- Explore deployment with AWS EC2
- Integrate common gems like Devise and Ahoy
- Experiment with building multiple projects in a single Rails environment

---

## Tech Stack

- **Framework:** Ruby on Rails
- **Language:** Ruby
- **Database:** SQLite (development), PostgreSQL (production)
- **Hosting:** AWS EC2

---

## Experimental Features

### LOOM-LEGACY (Textile Simulation)
- Basic integration between production, inventory, and sales modules
- Visitor tracking using `ahoy_matey`, `geocoder`, and `browser`
- Simple feedback submission system

### Chatting App (Prototype)
- Basic real-time messaging simulation (unpolished)
- Created to explore ActionCable and WebSocket concepts

---

## Gems Used

- `devise` – user authentication
- `pg` – PostgreSQL support
- `ahoy_matey` – user analytics
- `geocoder` – IP-based location tracking
- `browser` – browser/device detection
- `actionmailer`, `mail` – basic email functionality

---

## Setup (For Learning Purposes)

### Prerequisites

- Ruby 3.x
- Rails 7.1
- PostgreSQL
- AWS EC2 (optional)

### Installation

```bash
git clone https://github.com/AliIshaqPro/LOOM-LEGACY.git
cd loom-legacy
bundle install
rails db:create
rails db:migrate
rails server
