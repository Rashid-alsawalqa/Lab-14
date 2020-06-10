CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM book;
ALTER TABLE book ADD COLUMN bookshelf_id INT;
UPDATE book SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE book.bookshelf = shelf.name;
ALTER TABLE book DROP COLUMN bookshelf;
ALTER TABLE book ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);