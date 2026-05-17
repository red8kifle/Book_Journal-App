# book_journal_app

A Flutter app I built to track my reading journey. You can add books, rate them, update their reading status, and write personal notes — all synced with a backend API.

# Screenshots

# Features
 Add, edit, and delete books
 Rate books from 1 to 5
 Track reading status — Planned, Reading, Completed
 Search books by title or author
 Write and save personal notes for each book
 Data synced with a REST API
 
# project structure
lib/
├── core/
│   └── constants/
│       └── app_colors.dart       # Color constants
├── models/
│   └── book_model.dart           # Book data model
├── providers/
│   └── book_provider.dart        # State management
├── screens/
│   ├── home_screen.dart          # Book list + search
│   ├── add_book_screen.dart      # Add new book
│   ├── edit_book_screen.dart     # Edit existing book
│   └── book_detail_screen.dart   # Book details + notes
├── services/
│   └── api_service.dart          # API calls
├── widgets/
│   ├── book_card.dart            # Reusable book card
│   ├── rating_widget.dart        # Star rating display
│   └── status_chip.dart          # Status badge
└── main.dart                     # App entry point
