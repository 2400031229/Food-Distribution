-- Users table
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(150),
  role VARCHAR(20), -- admin, donor, recipient, analyst
  verified BOOLEAN DEFAULT false
);

-- Donations table
CREATE TABLE donations (
  donation_id SERIAL PRIMARY KEY,
  donor_id INT REFERENCES users(user_id),
  food_type VARCHAR(100),
  quantity INT,
  unit VARCHAR(20),
  expiry TIMESTAMP,
  status VARCHAR(20) DEFAULT 'available', -- available, claimed, completed
  created_at TIMESTAMP DEFAULT NOW()
);
