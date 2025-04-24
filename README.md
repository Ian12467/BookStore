# BookStore
# 📘 BookStore Database Project

## 🧱 ER Diagram Preview

👉 **[Click to View the Bookstore ERD on dbdiagram.io](https://dbdiagram.io/e/6809e3a41ca52373f52748ac/6809e61f1ca52373f527b419)**

![View ERD](https://img.shields.io/badge/View-ER%20Diagram-blue?style=for-the-badge&logo=mysql&link=https://dbdiagram.io/e/6809e3a41ca52373f52748ac/6809e61f1ca52373f527b419)

---

## 📦 Project Summary

This is a full-stack SQL-based database system for managing a bookstore's operations. It includes schema creation, user access control, and sample queries for testing.

---

## 📂 Project Files

| File | Description |
|------|-------------|
| `schema.sql` | SQL code to create all database tables |
| `sample_data.sql` | Optional: sample inserts to test relationships |
| `users_roles.sql` | SQL to create MySQL users with permissions |
| `queries.sql` | Sample queries for data analysis |
| `README.md` | Documentation |
| `bookstore_erd.drawio` | Visual ERD schema (optional) |

---

## 🚀 Setup Instructions

```bash
# Clone the repository
git clone https://github.com/your-username/bookstore-db-project.git
cd bookstore-db-project

# Open MySQL and run
SOURCE schema.sql;
SOURCE users_roles.sql;
