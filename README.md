# 📦 AI Rating Analysis

A Ruby on Rails application for analyzing product reviews with AI and generating multi-modal insights such as sentiment predictions, rating analysis, product image heatmaps, and more.

This app stores *review payloads* (text, product images, shop images, ratings) and attaches AI-generated analysis results and visualizations. ([GitHub][2])

---

## 🧠 What It Does

AI Rating Analysis lets you:

* 📥 Upload **reviews** with product & shop images and numeric ratings
* 🤖 Run AI-driven analysis on review text (e.g., sentiment, tone)
* 🔍 Store analyzed results in the database
* 📊 Generate and attach **CNN heatmaps** for image interpretation
* 📁 Serve data through web UI or API endpoints (controllers present) ([GitHub][3])

---

## 🗂️ Key Concepts

### 🧾 Payloads

A `Payload` is a core model representing a submitted review with:

* Product & shop images
* Free-text comment
* Product/service/delivery numeric ratings (1–5)
* AI analysis results stored as structured JSON
* Associated CNN heatmaps for visual interpretability ([GitHub][4])

---

### 📈 CNN Heatmaps

The `CnnHeatmap` model stores heatmaps related to payload image processing. Supported model backbones include:

* **ResNet50**
* **GoogleNet**
* **VGG16**

Heatmaps can be attached and visualized per payload. ([GitHub][5])

---

## 🚀 Getting Started

### Requirements

* Ruby ~> 3.x (aligned with Rails 8; see `Gemfile`) ([GitHub][6])
* Rails 8.x
* SQLite3 (default DB)
* Node.js + Yarn (if JavaScript build needed)

---

### Setup

```bash
git clone https://github.com/vinhbt241/ai_rating_analysis.git
cd ai_rating_analysis

bundle install

# Database
rails db:create
rails db:migrate
```

---

### Running the App

Start the local server:

```bash
rails server
```

Visit:

```
http://localhost:3000
```

---

## 🎯 Endpoints (Controllers)

The repository contains several controllers:

* `PayloadsController` — create/list payloads and perform analysis
* `WelcomeController` — home/welcome pages
* Namespaced concerns and payload routes enable structured API or UI flows ([GitHub][3])

---

## 📦 Dependencies

Key gems used (see `Gemfile`):

* **rails** — web framework
* **sqlite3** — database
* **ruby-openai** — OpenAI API client
* **simple_form** — form helpers
* **jsbundling-rails / cssbundling-rails** — frontend assets
* **kamal** / **thruster** — background processing helpers ([GitHub][6])

---

## 🛠️ Development Notes

* AI integrations likely use `ruby-openai` for language tasks
* CNN heatmaps likely generated via background jobs
* Frontend scaffolds may leverage Turbo / Stimulus

---

## 🚧 Future Improvements

Consider adding:

✔ API authentication
✔ Background job processing (Sidekiq / ActiveJob)
✔ Automated tests and CI
✔ Frontend React/Vue component for interactive review insights
✔ Deployment scripts (Docker / Kubernetes)

---

## 🧪 Tests

No test suite is present by default, but you can add:

```bash
rails test
```

or use RSpec if added later.

---

## 📜 License

This project does not currently specify a license — consider adding one (MIT, Apache-2.0, etc.).

[5]: https://github.com/vinhbt241/ai_rating_analysis/blob/main/app/models/cnn_heatmap.rb "ai_rating_analysis/app/models/cnn_heatmap.rb at main · vinhbt241/ai_rating_analysis · GitHub"
[6]: https://github.com/vinhbt241/ai_rating_analysis/blob/main/Gemfile "ai_rating_analysis/Gemfile at main · vinhbt241/ai_rating_analysis · GitHub"
