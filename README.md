# Auto Parts Ordering System

This project aims to develop an efficient and user-friendly auto parts ordering system. The platform streamlines the process of ordering car parts for users, providing a seamless experience. The system includes distinct user roles with specific functionalities:

- **Guests:** Browse/search for automotive parts, register, and log in.
- **Customers:** Add parts to their cart, place orders, view order history, and pay securely using Stripe.
- **Sellers:** Manage inventory by adding/updating parts, reviewing orders, and updating order statuses.
- **Administrators:** Oversee the platform by managing customers, sellers, car parts, brands, models, part categories, and orders.

---

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
  - [Guest Features](#guest-features)
  - [Customer Features](#customer-features)
  - [Seller Features](#seller-features)
  - [Administrator Features](#administrator-features)
- [Installation](#installation)
  - [Ruby on Rails Installation Guide](#ruby-on-rails-installation-guide)
  - [Prerequisites](#prerequisites)
  - [Steps](#steps)

---

## About the Project

The Auto Parts Ordering System provides an intuitive and streamlined interface for ordering car parts, catering to guests, customers, sellers, and administrators with unique roles and functionalities.

---

## Features

### Guest Features

- Browse and search for car parts.
- Register as a customer and log in.
- Reset password by providing a registered email address.

### Customer Features

- Browse and search for car parts.
- Add car parts to the shopping cart.
- Modify the cart by changing item quantities or removing items.
- Place orders from the shopping cart.
- View order history, including ordered items and delivery details.
- Update profile information.

### Seller Features

- Create, edit, or delete car parts.
- View all car parts and orders.
- Update the order status of items.
- Update profile information.

### Administrator Features

- Manage sellers: Create, view, or delete seller accounts.
- Manage customers: View or delete customer accounts.
- Manage car parts: View or delete car parts.
- Manage system data: Create, edit, or delete records for car part types, car brands, and car models.
- View all orders and related items.
- Update profile information.

---

## Installation

### Ruby on Rails Installation Guide

If you're using **Windows 11**, follow the guide on [GoRails](https://gorails.com/setup/windows/11) for a step-by-step installation process.

### Prerequisites

Ensure the following are installed on your system:

- **Ruby:** Version 3.3.6
- **Rails:** Version 8.0.1
- **PostgreSQL:** As the database for the application.

### Steps

Follow these steps to set up and run the project locally:

1. **Install dependencies:**
   Clone the project repository from GitHub to your local machine:

   ```bash
   git clone https://github.com/yourusername/auto_part.git
   ```

   Navigate into the project directory:

   ```bash
   cd auto_part
   ```

   Install the required Ruby gems:

   ```bash
   bundle install
   ```

2. **Apply database migrations:**
   Run the database migrations to set up the database schema:

   ```bash
   bin/rails db:migrate
   ```

3. **Seed the database:**
   Populate the database with initial data:

   ```bash
   bin/rails db:seed
   ```

4. **Set system credentials:**
   Open the Rails credentials file to add the required environment variables:

   ```bash
   EDITOR=vim rails credentials:edit
   ```

   Add the following to the credentials file:

   ```yaml
   stripe:
     secret_key: your_stripe_secret_key
     public_key: your_stripe_public_key

   brevo_smtp:
     email: your_brevo_smtp_email
     password: your_brevo_smtp_password
   ```

   Replace `your_stripe_api_key` and `your_stripe_public_key` with your actual Stripe API credentials.
   Replace `your_brevo_smtp_email` and `your_brevo_smtp_password` with your actual Brevo credentials.

5. **Precompile assets (optional):**
   If you are preparing for deployment or running in a production environment, precompile the assets:

   ```bash
   bin/rails assets:precompile
   ```

6. **Run the server:**
   Start the Rails server to launch the application locally:

   ```bash
   bin/rails server
   ```

7. **Access the application:**
   Open a web browser and navigate to:
   [http://localhost:3000](http://localhost:3000)

   You can now interact with the application.

---
