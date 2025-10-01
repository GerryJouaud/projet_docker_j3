// app/page.tsx
import Link from "next/link"; 

type Post = {
  id: string | number;
  title: string;
  content?: string;
};

async function getPosts(): Promise<Post[]> {
  try {
    const res = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/posts`, {
      cache: "no-store", // pas de cache pour toujours récupérer la version à jour
    });

    if (!res.ok) {
      throw new Error(`Erreur API: ${res.status}`);
    }

    return res.json();
  } catch (error) {
    console.error("Erreur lors du fetch des posts:", error);
    return [];
  }
}

export default async function HomePage() {
  const posts = await getPosts();

  return (
    <main className="p-6">
      <h1 className="text-2xl font-bold mb-4">Liste des posts</h1>

      {posts.length === 0 ? (
        <p className="text-red-500">
          Impossible de charger les posts (API indisponible ?)
        </p>
      ) : (
        <ul className="space-y-2">
          {posts.map((post) => (
            <li key={post.id}>
              <Link
                href={`/posts/${post.id}`}
                className="text-blue-600 hover:underline"
              >
                {post.title}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </main>
  );
}
