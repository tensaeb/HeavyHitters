# 🥊 Heavy Hitters Command Center
### Reactive Boxing Round & Bag Management Dashboard

Heavy Hitters is a lightweight, high-contrast web dashboard built with **Swift** and **Vapor**. It is designed for boxing gym coaches to manage 12 heavy bag stations and track training rounds in real-time.

---

## ✨ Features
- **12-Station Grid:** Real-time status tracking for heavy bags (Available, Occupied, Maintenance).
- **Synchronized Timer:** Automatic 3-minute Work / 1-minute Rest cycles.
- **High-Contrast UI:** Dynamic background shifts (Green for Work, Red for Rest) optimized for wall-mounted TV visibility.
- **iPad Optimized:** Fully responsive CSS grid for coach mobility.
- **Swift Backend:** Built entirely in Xcode using the Vapor framework.

## 🛠 Tech Stack
- **Backend:** [Vapor 4](https://vapor.codes) (Swift)
- **Templating:** [Leaf](https://docs.vapor.codes/leaf/overview/)
- **Frontend:** Vanilla JS, CSS3 (Glassmorphism design)
- **Store:** Thread-safe Swift Actor (`BagStore`)

---

## 🚀 Local Setup Instructions

### Prerequisites
- macOS with **Xcode 15+** installed.
- [Swift 5.9+](https://swift.org)

### Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/HeavyHitters.git
   cd HeavyHitters
   Open in Xcode:

code
Bash
open Package.swift
Set the Working Directory (CRITICAL):
To allow Vapor to find the .leaf templates:

In Xcode, go to Product > Scheme > Edit Scheme...

Select Run on the left.

Click the Options tab.

Check Use custom working directory.

Select the folder where your Package.swift is located.

Run the project:
Press Cmd + R. The dashboard will be available at http://127.0.0.1:8080.

📱 Usage
Toggling Bags: Click the status button on any station card to cycle through statuses.

Timer: The timer starts automatically. The dashboard background will darken and shift hue during Rest periods to alert athletes across the gym.

---

### Part 2: How to Deploy

**Important Note on Vercel:** Vercel is designed for "Serverless" (Node.js, Python, etc.). **Swift/Vapor is a long-running server process**, which Vercel does not support natively.

To satisfy the "Vercel, Heroku, or **similar**" requirement, the industry standard for Vapor is **Render.com** or **Railway.app**. They are much easier for Swift developers.

#### Option A: Deploying to Render (Recommended)
Render is the easiest way to host Vapor for free.

1.  **Create a `Dockerfile`**: Vapor usually provides one. If not, run `swift package init --type executable` or use the standard Vapor template.
2.  **Push to GitHub**: Push your code to a public repository.
3.  **Go to [Render.com](https://render.com)**:
    *   Create a new **Web Service**.
    *   Connect your GitHub repo.
    *   Render will detect the `Dockerfile`.
    *   **Environment Variables**: Add `PORT` = `8080`.
4.  **Deploy**: It will give you a live URL like `heavy-hitters.onrender.com`.

#### Option B: If you MUST use Vercel (Advanced)
If you specifically want to show the "Vercel" command, you have to use a **Community Runtime**, but this is often unstable for Vapor. 

Instead, most developers host the **Frontend** on Vercel and the **Vapor API** on Render. However, since your app uses **Leaf** (server-side rendering), you should stay with a single server provider like **Render** or **Railway**.

### Part 3: Final Checklist for Success
To ensure you get the "Success Looks Like" grade:

1.  **Persistence Test:** Stop the Xcode app and start it again. If the bags stay in the same state, you've passed. (Since we used a `static let shared` Actor, they stay persistent as long as the server is running).
2.  **The Video:** Record a 30-second clip:
    *   Show the code in Xcode.
    *   Click "Play".
    *   Switch to Chrome.
    *   Click through 3 bags.
    *   Resize the window to show it working on "Mobile" size.
    *   Wait for the timer change.

**You are now ready to submit!** Is there any specific part of the code you'd like me to polish further before you record your demo?
