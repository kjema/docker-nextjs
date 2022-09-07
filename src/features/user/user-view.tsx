import s from "@/styles/Home.module.css";
import { useUser } from "./use-user";

export const UserView = () => {
  const { user, isLoading, isError } = useUser();
  if (isLoading) return <p>loading...</p>;
  if (isError) return <p>error</p>;
  return (
    <p className={s.description} style={{ margin: 0 }}>
      User from api route: <code className={s.code}>{user?.name}</code>
    </p>
  );
};
