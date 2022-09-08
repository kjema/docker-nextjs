import useSWR from "swr";

type User = {
  name: string;
};

const fetcher = (url: string) => fetch(url).then((r) => r.json());

export const useUser = () => {
  const { data, error } = useSWR<User>("/api/hello", fetcher);

  return {
    user: data,
    isLoading: !error && !data,
    isError: error,
  };
};
