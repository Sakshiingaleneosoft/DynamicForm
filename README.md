# DynamicForm (Swift+MVVM)

##  About the App
This app demonstrates a **3-page SwiftUI flow** with **dynamic form rendering from an API** using a clean **MVVM architecture**.

It includes:
- A **Login Page** with email + password validation.
- A **Dynamic Fields Page** where input fields are rendered based on API response.
- A **Display Page** that shows entered details in a proper sequence.

---

## 📱 Screens & Flow

### 1. Login Page
- Fields:
  - **Email** → validated using email keyboard.
  - **Password** → secure input.
- Contains a **Login Button**.
- On successful validation → navigates to **Dynamic Fields Page**.
- Shows **error messages** if validation fails.

**Code Reference:** `LoginView.swift`

---

### 2. Dynamic Fields Page
- Fetches fields from a **API** .
- Dynamically renders input fields depending on API response.
- Each field has:
  - `title` → used as label/placeholder.
  - `type` → decides keyboard type (e.g., text, email, phone, number).
  - `regex` → used for validation before submission.
- Uses a **List** of custom text fields (`CustomTextField`).
- Adds **“Done” toolbar button** for numeric/phone keyboards.
- On **Submit button click** → validates entered fields.
- If valid → navigates to **SubmittedDetailsView** with entered data.

**Code Reference:** `DynamicFieldsView.swift`, `DynamicFieldsViewModel.swift`

---

### 3. Submitted Details Page
- Displays details entered on Dynamic Fields Page.
- Shows fields in a **sequence getting from API**:
  - First Name
  - Last Name
  - Mobile Number
  - Email
- Skips fields that are **empty or missing**.

**Code Reference:** `SubmittedDetailsView.swift`

---

## 🌐 API Details
                                
Can Refer "https://dummyjson.com/" to customise API response

- **Base URL:**
  `https://dummyjson.com`

- **Endpoints:**
  `/c/ecba-d817-4ee0-8d3e`
  '/c/6dec-bc01-4978-83a8'

- **Full API URL:**
  `https://dummyjson.com/c/ecba-d817-4ee0-8d3e`

### Example Dummy Response
```json
{
  "fields": [
    {
      "title": "First Name",
      "type": "text",
      "regex": "^[A-Za-z]{2,}$"
    },
    {
      "title": "Email",
      "type": "email",
      "regex": "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
    },
    {
      "title": "Mobile Number",
      "type": "number",
      "regex": "^[0-9]{10}$"
    }
  ]
}
