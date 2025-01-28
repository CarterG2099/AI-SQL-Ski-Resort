INSERT INTO ikon_users (user_id, first_name, last_name, email, date_of_birth, skill_level) VALUES
(1, 'Laura', 'Stevenson', 'laura.stevenson@example.com', '1990-05-15', 'Advanced'),
(2, 'Bob', 'Jones', 'bob.jones@example.com', '1985-03-20', 'Intermediate'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '1992-07-10', 'Beginner'),
(4, 'Jimmy', 'Hendricks', 'jimmy.hendricks@example.com', '1988-01-22', 'Expert'),
(5, 'Sydney', 'Smith', 'sydney.smith@example.com', '1995-11-05', 'Advanced'),
(6, 'Jordan', 'Malone', 'jordan.malone@example.com', '1993-09-12', 'Intermediate');

INSERT INTO ikon_resorts (resort_id, name, location, elevation, total_trails) VALUES
(1, 'Aspen Snowmass', 'Aspen, Colorado', 8104, 150),
(2, 'Whistler Blackcomb', 'Whistler, British Columbia', 6530, 200),
(3, 'Park City Mountain', 'Park City, Utah', 6900, 330);

INSERT INTO ikon_phone (phone_id, entity_id, entity_type, phone_number) VALUES
(1, 1, 'User', '123-456-7890'),
(2, 2, 'User', '234-567-8901'),
(3, 3, 'User', '345-678-9012'),
(4, 4, 'User', '456-789-0123'),
(5, 5, 'User', '567-890-1234'),
(6, 6, 'User', '678-901-2345'),
(7, 1, 'Resort', '789-012-3456'),
(8, 2, 'Resort', '890-123-4567'),
(9, 3, 'Resort', '901-234-5678');

INSERT INTO ikon_address (address_id, entity_id, entity_type, street, city, state, zip_code) VALUES
(1, 1, 'User', '123 Maple Street', 'Aspen', 'CO', '81611'),
(2, 2, 'User', '456 Oak Road', 'Whistler', 'BC', 'V0N 1B4'),
(3, 3, 'User', '789 Birch Lane', 'Park City', 'UT', '84060'),
(4, 4, 'User', '101 Spruce Drive', 'Aspen', 'CO', '81612'),
(5, 5, 'User', '202 Cedar Way', 'Whistler', 'BC', 'V0N 1B5'),
(6, 6, 'User', '303 Pine Circle', 'Park City', 'UT', '84061'),
(7, 1, 'Resort', '400 Mountain Road', 'Aspen', 'CO', '81612'),
(8, 2, 'Resort', '500 Glacier Street', 'Whistler', 'BC', 'V0N 1B6'),
(9, 3, 'Resort', '600 Summit Avenue', 'Park City', 'UT', '84062');

INSERT INTO ikon_trails (trail_id, resort_id, name, difficulty, length_km) VALUES
(1, 1, 'Snowmass Trail', 'Blue', 5.2),
(2, 1, 'Aspen Glades', 'Black', 3.8),
(3, 2, 'Whistler Bowl', 'Double Black', 4.5),
(4, 3, 'Park City Loop', 'Green', 6.0);

INSERT INTO ikon_rentals (rental_id, user_id, equipment_type, rental_date, return_date, cost) VALUES
(1, 1, 'Ski', '2025-01-15', '2025-01-20', 200.00),
(2, 2, 'Snowboard', '2025-01-10', '2025-01-15', 180.00),
(3, 3, 'Helmet', '2025-01-12', '2025-01-13', 20.00);

INSERT INTO ikon_events (event_id, resort_id, name, event_date, description) VALUES
(1, 1, 'Winter Fest', '2025-02-15', 'A celebration of winter sports and activities.'),
(2, 2, 'Snowboard Showdown', '2025-03-10', 'A thrilling snowboard competition.'),
(3, 3, 'Family Ski Day', '2025-01-25', 'A fun day for families on the slopes.');

INSERT INTO ikon_lift_tickets (ticket_id, user_id, resort_id, ticket_type, purchase_date, price) VALUES
(1, 1, 1, 'Base', '2025-01-10', 120.00),
(2, 2, 2, 'Session', '2025-01-11', 150.00),
(3, 3, 3, 'Plus', '2025-01-12', 200.00);

INSERT INTO ikon_weather_reports (report_id, resort_id, report_date, temperature_c, snow_depth_cm, conditions) VALUES
(1, 1, '2025-01-10', -5.0, 50, 'Snowing'),
(2, 2, '2025-01-11', -3.0, 60, 'Sunny'),
(3, 3, '2025-01-12', -8.0, 70, 'Cloudy');

INSERT INTO ikon_reviews (review_id, user_id, resort_id, rating, review_text, review_date) VALUES
(1, 1, 1, 5, 'Aspen Snowmass was fantastic! Great for advanced skiers.', '2025-01-20'),
(2, 1, 2, 4, 'Whistler was amazing, but a bit crowded.', '2025-01-22'),
(3, 1, 3, 3, 'Park City was okay, but the trails were a bit icy.', '2025-01-24'),
(4, 2, 1, 4, 'Aspen had great intermediate trails!', '2025-01-18'),
(5, 2, 2, 5, 'Whistler is my favorite resort. Stunning views.', '2025-01-20'),
(6, 2, 3, 4, 'Park City was fun, but it could use better signage.', '2025-01-22'),
(7, 3, 1, 3, 'Aspen is beautiful but challenging for beginners.', '2025-01-15'),
(8, 3, 2, 4, 'Whistler was a good experience for beginners.', '2025-01-17'),
(9, 3, 3, 5, 'Park City is very beginner-friendly. Loved it!', '2025-01-19'),
(10, 4, 1, 5, 'Aspen is the perfect resort for experts.', '2025-01-12'),
(11, 4, 2, 4, 'Whistler has excellent double-black trails.', '2025-01-14'),
(12, 4, 3, 3, 'Park City is good but not as challenging.', '2025-01-16'),
(13, 5, 1, 4, 'Aspen has some great advanced trails.', '2025-01-11'),
(14, 5, 2, 5, 'Whistler was amazing. Highly recommend.', '2025-01-13'),
(15, 5, 3, 4, 'Park City was fun but not as exciting.', '2025-01-15'),
(16, 6, 1, 3, 'Aspen was decent for intermediate skiers.', '2025-01-10'),
(17, 6, 2, 4, 'Whistler had great slopes for intermediates.', '2025-01-12'),
(18, 6, 3, 5, 'Park City was fantastic for a day trip!', '2025-01-14');