// app/posts/[id]/page.tsx
import Link from "next/link";
import { notFound } from "next/navigation";

type User = {
  id: string | number;
  name: string;
};

type Post = {
  id: string | number;
  title: string;
  content: string;
  user?: User;
};

async function getPost(id: string): Promise<Post | null> {
  try {
    const res = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/posts/${id}`, {
      cache: "no-store",
    });

    if (res.status === 404) {
      return null; // gestion du 404
    }

    if (!res.ok) {
      throw new Error(`Erreur API: ${res.status}`);
    }

    return res.json();
  } catch (error) {
    console.error("Erreur lors du fetch du post:", error);
    return null;
  }
}

export default async function PostPage({ params }: { params: { id: string } }) {
  const post = await getPost(params.id);

  if (!post) {
    notFound(); // redirige vers app/not-found.tsx
  }

  return (
    <main className="p-6">
      <h1 className="text-3xl font-bold mb-4">{post!.title}</h1>
      <p className="mb-4">{post!.content}</p>

      {post!.user && (
        <p className="text-sm text-gray-600 mb-6">
          Auteur : {post!.user.name}
        </p>
      )}

      <Link href="/" className="text-blue-600 hover:underline">
        ← Retour à la liste
      </Link>
    </main>
  );
}
