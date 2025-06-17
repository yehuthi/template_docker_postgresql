CREATE TABLE "user"(
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "email" TEXT NOT NULL UNIQUE,
    "password_hash" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE UNIQUE INDEX user_email_lower_idx ON "user"(LOWER("email"));
ALTER TABLE "user" OWNER TO "teder";

CREATE TABLE profile(
    "user" INTEGER NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
    "name" TEXT NOT NULL,
    "gender" TEXT,
    "birthday" JSON,
    "bio" TEXT,
    "avatar" TEXT
);
ALTER TABLE profile OWNER TO "teder";
