
CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    branch_id INT NOT NULL REFERENCES branches(branch_id),
    room_type VARCHAR(50) NOT NULL,
    nightly_rate NUMERIC(10,2) NOT NULL
        CHECK (nightly_rate >= 0)
);

CREATE TABLE guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(100) NOT NULL
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT NOT NULL REFERENCES guests(guest_id),
    room_id INT NOT NULL REFERENCES rooms(room_id),
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    CHECK (check_out > check_in)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES bookings(booking_id),
    amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0),
    payment_status VARCHAR(20) NOT NULL
);

INSERT INTO branches VALUES
(1, 'Central Hotel', 'Kochi'),
(2, 'Seaside Hotel', 'Kozhikode'),
(3, 'City Hotel', 'Thrissur');

INSERT INTO rooms VALUES
(101, 1, 'Standard', 2500),
(102, 1, 'Deluxe', 4000),
(201, 2, 'Standard', 2200),
(301, 3, 'Deluxe', 3500);

INSERT INTO guests VALUES
(1, 'Guest A'),
(2, 'Guest B'),
(3, 'Guest C');

INSERT INTO bookings VALUES
(1001, 1, 101, '2026-01-10', '2026-01-12', 'Completed'),
(1002, 2, 102, '2026-01-15', '2026-01-18', 'Completed'),
(1003, 3, 201, '2026-02-01', '2026-02-03', 'Cancelled'),
(1004, 1, 301, '2026-02-10', '2026-02-12', 'Completed');

INSERT INTO payments VALUES
(1, 1001, 5000, 'Paid'),
(2, 1002, 12000, 'Paid'),
(3, 1003, 0, 'Refunded'),
(4, 1004, 7000, 'Paid');
