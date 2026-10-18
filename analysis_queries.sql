
-- 1. Compare paid revenue by branch
SELECT
    br.branch_name,
    SUM(p.amount) AS paid_revenue
FROM branches br
JOIN rooms r ON br.branch_id = r.branch_id
JOIN bookings b ON r.room_id = b.room_id
JOIN payments p ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Paid'
GROUP BY br.branch_id, br.branch_name
ORDER BY paid_revenue DESC;


-- 2. Count completed bookings by branch
SELECT
    br.branch_name,
    COUNT(b.booking_id) AS completed_bookings
FROM branches br
JOIN rooms r ON br.branch_id = r.branch_id
JOIN bookings b ON r.room_id = b.room_id
WHERE b.status = 'Completed'
GROUP BY br.branch_id, br.branch_name
ORDER BY completed_bookings DESC;


-- 3. Find guests with more than one booking
SELECT
    g.guest_name,
    COUNT(b.booking_id) AS booking_count
FROM guests g
JOIN bookings b ON g.guest_id = b.guest_id
GROUP BY g.guest_id, g.guest_name
HAVING COUNT(b.booking_id) > 1;


-- 4. Show each booking with branch and payment information
SELECT
    b.booking_id,
    br.branch_name,
    g.guest_name,
    b.status AS booking_status,
    COALESCE(p.amount, 0) AS payment_amount,
    p.payment_status
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id
JOIN branches br ON r.branch_id = br.branch_id
LEFT JOIN payments p ON b.booking_id = p.booking_id
ORDER BY b.booking_id;
