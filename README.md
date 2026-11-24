# CREOVA AI — Flutter App (UI/UX)

AI-powered influencer marketing platform that connects brands with verified **Media Buyers** and **UGC Creators**. This repository contains the mobile app UI/UX built with Flutter, implementing the screens and flows defined in the system architecture design (graduation project).

## What the app does

1. **Account & Profile** — register as a Brand, Media Buyer or UGC Creator.
2. **Portfolio & AI Analysis** — providers publish portfolio items; the AI service tags them (industry, content type, platform) and writes short feedback.
3. **Campaign Planning** — a brand writes a brief (objective, platforms, budget, dates); an async AI job (10–30 s) generates a versioned campaign plan: budget split, timeline and estimated KPIs. A fallback plan keeps the journey alive if the AI service is down.
4. **Discovery & Matching** — transparent, explainable matching: `score = w1·skills + w2·platform + w3·budget + w4·rating + w5·availability + w6·new-provider boost`, each recommendation shows its reasons ("Why this match").
5. **Proposals & Workspace** — proposals with statuses; on acceptance a workspace opens with real-time chat (WebSockets).
6. **Deliverables** — versioned file submissions with approve / request-changes flow.
7. **Ratings & Reporting** — one review per completed project updates the provider's rating.
8. **Admin** — statistics, provider verification queue, matching-weight configuration (audit-logged) and anomaly checks.
9. **Notifications** — in-app notifications plus push (FCM).

## Architecture

- **Flutter app** — Clean Architecture + BLoC, feature-first structure (`features/<module>/{data,domain,presentation}`), `go_router` navigation, Arabic/English localization with RTL support.
- **Backend** — Laravel modular monolith (REST API, MySQL, Redis queues), the single entry point; see the architecture document.
- **AI service** — FastAPI serving the team's own models (`/v1/plan`, `/v1/embed`, `/v1/portfolio/analyze`, `/v1/explain`), callable only by Laravel.

This repo currently holds the **presentation layer**: all 9 modules' screens with demo data, dark modern theme (Inter + Cairo fonts), and a web build for demo purposes.

## Run it

```bash
flutter pub get
flutter run            # mobile / desktop
flutter run -d chrome  # web
```

## Screens

17 screens covering every module: splash, onboarding, login, role selection, brand dashboard, campaign brief form, AI plan generation, plan review, discovery & matching, provider profile with AI portfolio analysis, proposals, workspace chat, deliverables, rating, notifications, admin console, and an Arabic RTL home.
