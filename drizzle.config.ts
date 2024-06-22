import type { Config } from 'drizzle-kit'

export default {
    dialect: "postgresql", // "sqlite" | "mysql"     
    schema: './src/db/schema.ts',
    dbCredentials: {
        url: process.env.DATABASE_URL!,
    },
    out: './drizzle',
} satisfies Config