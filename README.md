# 📄 ZephyrPay Performance and Debugging Assessment

## 📝 Project Overview

Welcome to the **ZephyrPay** assessment project. You have been provided with a partial Flutter app that simulates a fintech application. The app fetches transaction data from a mock API, caches it for offline use, and displays it in a simple list view.

### Main Features:

- Display a list of financial transactions.
- Pull-to-refresh to update the transaction list.
- Offline caching of transaction data.
- Simple navigation to transaction details.

---

## 🚀 Getting Started

### Prerequisites:

- Flutter SDK (latest stable version)
- Android Studio / VS Code (recommended)
- Android or iOS emulator (or a physical device)

### Installation:

1. Clone the repository:

   ```bash
   git clone <repository_url>
   ```

2. Navigate to the project directory:

   ```bash
   cd zephyrpay
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

---

## 🎯 Assessment Objectives

Your primary goal is to **improve the performance, stability, and code architecture** of the app. You will find that the current implementation has several flaws that need addressing.

### Focus Areas:

1. **Performance Optimization:**

   - Improve the scrolling performance of the transaction list.
   - Identify and eliminate jank during data loading.
   - Utilize background isolates for heavy data processing if necessary.
   - Profile the app before and after optimization to quantify improvements.

2. **Architecture Refinement:**

   - Refactor the code to enhance maintainability and scalability.
   - Avoid rebuilding the entire UI on minor data changes.
   - Separate business logic from UI for better state management.

3. **Stability & Robustness:**

   - Fix the data duplication issue during pull-to-refresh.
   - Implement proper error handling for API failures.
   - Ensure offline caching works without causing memory leaks.

4. **Judgment and Justification:**

   - Clearly document any architectural or design decisions you make.
   - Justify the introduction of new libraries or patterns.

---

## 🧩 What to Fix

The current implementation has known issues. Use your skills to address the following:

1. **Slow Scrolling Performance:** The transaction list becomes laggy as the number of items increases.
2. **Data Duplication:** Pull-to-refresh sometimes duplicates transaction entries.
3. **Memory Leak:** Large lists cause memory issues.
4. **Poor State Management:** The entire UI rebuilds on every data change.
5. **Error Handling:** Network errors are not handled gracefully.

---

## 🛠️ What You Are Expected to Deliver

1. **Optimized Codebase:**

   - Improve performance, architecture, and stability as described.

2. **Profiling Results:**

   - Use Flutter DevTools to compare performance before and after optimization.
   - Include screenshots or a brief summary of your profiling data.

3. **Documentation:**

   - Write a **short report (README or a separate file)** explaining:

     - Key issues identified
     - Fixes implemented
     - Performance improvements with benchmarks
     - Trade-offs and design decisions

4. **Code Quality:**

   - Follow Flutter best practices.
   - Ensure clean, maintainable, and well-documented code.

---

## 📂 Project Structure

```
zephyrpay/
├── lib/
│   ├── main.dart
│   ├── models/
│   │     └── transaction.dart
│   ├── services/
│   │     └── zephyr_api_service.dart
│   ├── repository/
│   │     └── transactions_repository.dart
│   ├── screens/
│   │     ├── transactions_page.dart
│   │     └── transaction_detail_page.dart
│   └── utils/
│         └── logger.dart
├── pubspec.yaml
└── README.md
```

---

## 🔥 Evaluation Criteria

Your submission will be evaluated on the following criteria:

1. **Performance Improvement (30%):**

   - Smooth scrolling, reduced jank, efficient data handling.
   - Demonstration of profiling and analysis before/after optimization.

2. **Code Architecture (30%):**

   - Clean, modular code.
   - Appropriate use of state management.
   - Reduced coupling between UI and business logic.

3. **Stability and Robustness (20%):**

   - Fixes for data duplication and memory leaks.
   - Proper error handling for network failures.
   - Offline support with correct caching behavior.

4. **Documentation and Reasoning (20%):**

   - Clear explanation of improvements.
   - Justification of chosen methods and design patterns.
   - Documentation of trade-offs and limitations.

---

## 📝 Submission Instructions

1. **Fork the Repository:**

   - Use the private GitHub repository link provided.

2. **Work on Your Fork:**

   - Use meaningful commit messages.
   - Keep track of changes and document your improvements.

3. **Submit Your Work:**

   - Create a **pull request (PR)** to the original repository.
   - Include your README/report file.
   - Add a summary in the PR description about your improvements and key changes.

### **Deadline:**

Submit your PR within **2 days** from receiving the assignment. Late submissions will not be considered.

---

## 💡 Additional Tips

- Think of this as a real-world project where you own the product.
- Focus on **incremental improvements** rather than rewriting everything.
- Be pragmatic with your time – choose optimizations that give the most benefit.
- Use comments wisely to explain complex logic or unconventional fixes.
- Be ready to discuss your decisions and any challenges you encountered.

---

## 📧 Support

If you encounter any issues or have questions, please contact the hiring manager directly.
Do not share or discuss the assignment publicly.

---

Good luck, and show us how you can turn a messy, slow app into a **polished, performant product**! 🚀

---

## Submission report

## 🧱 New Architecture Explanation

### 🔁 Layered Clean Architecture

```plaintext
feature/
├── transactions/
│   ├── data/                # Data layer: DTOs, APIs, Repositories Impl
│   │   ├── datasources/
│   │   ├── models/
│   │   └── repositories/
│   ├── domain/              # Domain layer: Entities, Usecases, Abstract Repos
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   ├── presentation/        # UI layer: Pages, Providers, Widgets
│   │   ├── pages/
│   │   ├── providers/
│   │   └── widgets/
```

### 📌 Key Design Choices

- **Riverpod** is used for state management (scoped providers).
- **UseCase Driven**: Each domain logic is accessed via a specific use case.
- **Decoupled Repository**: Allows easy swapping of implementation
- **Modular Components**: Easy to extend and test in isolation.

---
### Performance aspects
- Used listview.separated
- Used Boundary for list tile
- Used autodispose provider
- Used riverpod async builder, UI will rendered only when data is changed
---
### Performance Screenshots
**Before**:
![app_start_performance_before_code changes](https://github.com/user-attachments/assets/0f015d18-b9e5-4e90-a2e9-f104b48da649)
**After**:
![junk issue solved while scrolling long list](https://github.com/user-attachments/assets/9d9fe647-3b10-4623-b380-6dc56e4804c2)

### future considerations
- Paginated loading of data
- Offline support(TBD becuase data security reasons, if still want this, need to use encryption measures)
- Filters, spending charts



  

