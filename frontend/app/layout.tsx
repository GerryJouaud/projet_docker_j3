import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Mon Application",
  description: "Une application Next.js avec layout de base",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="fr">
      <body>
        <header className="p-4 bg-gray-100 shadow">
          <nav className="container mx-auto flex justify-between items-center">
            <h1 className="text-xl font-bold">Mon App</h1>
            <ul className="flex gap-4">
              <li><a href="/" className="hover:underline">Accueil</a></li>
              <li><a href="/about" className="hover:underline">À propos</a></li>
            </ul>
          </nav>
        </header>

        <main className="container mx-auto p-6">{children}</main>
      </body>
    </html>
  );
}
